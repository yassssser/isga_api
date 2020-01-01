<?php

namespace App\Controller;

use App\Entity\Etudiant;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class AppController extends AbstractController
{
     //  UserPasswordEncoderInterface $passwordEncoder

    /**
     * @Route("/login/{email}/{psd}", name="login" , methods={"GET"})
     */
    public function index($email,$psd)
    {
       // $etd = new Etudiant();
        $repository = $this->getDoctrine()->getRepository(Etudiant::class);

      //  $crypt =$etd->setPassword($passwordEncoder->encodePassword($etd , 'password123'));

        $etudiant = $repository->findOneBy(['email' => $email , 'password' => $psd]);
        return $this->json($etudiant);
    }
}
